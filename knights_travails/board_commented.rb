require_relative 'node'

class Board
    def initialize
    end

    # check if position is within [1,1] to [8,8]
    # return boolean
    def valid?(position)
        return "input to [valid?] was not a position." unless position.is_a? Array
        return position[0].between?(1,8) && position[1].between?(1,8)
    end

    # retrieve shortest path
    # returns console message
    def knight_moves(initial,destination)
        return "inputs to [knight_moves] were not both valid positions" unless valid?(initial) && valid?(destination)

        initial = Node.new(initial,"starting position")
        queue = []; queue << initial
        level = []; counter = 0
        reached = []; hit = false
        current = initial

        # builds tree
        # stops after clearing the level at which the answer is found
        until hit == true && level.empty?

            # queue only contains elements of the same level
            until queue.empty?
                level << queue.shift
            end

            # always clears out each level
            until level.empty?
                current = level.shift
                
                if current.position == destination
                    hit = true
                    reached << current
                elsif hit == true
                    # do nothing
                else
                    # retrieve all valid paths
                    # new node for each valid path
                    # add as child to current (array of nodes)
                    # add each child to queue
                    paths = knight_next(current.position)
                    paths.each do |xy|
                        move = Node.new(xy,current.object_id)
                        current.children << move
                        queue << move
                    end
                end
            end

            counter += 1

        end

        # retrieves answers
        # [reached] is an array of nodes that arrived at the solution.
        # length of array is number of paths.
        # run Node.parent until root gives reverse path to destination.
        reverse_path = []; trace = reached[0]
        until trace.parent == "starting position"
            reverse_path << trace.position
            trace = ObjectSpace._id2ref(trace.parent)
        end
        reverse_path << initial.position        
        path = reverse_path.reverse

        puts "#{reached.length} path(s) of minimum #{counter} steps found. \nThis is one of them:"
        puts "#{path}"
    end

    # all available next moves
    # returns array of arrays
    def knight_next(position)
        return "input to [knight_next] was not a position." unless position.is_a? Array
        paths = [[-2,-1],[-1,-2],[1,-2],[2,-1],[2,1],[1,2],[-1,2],[-2,1]]
        paths.map!{ |xy| xy[0] = position[0] + xy[0], xy[1] = position[1] + xy[1]}
        paths.select!{ |xy| valid?(xy)}
        return paths
    end
end