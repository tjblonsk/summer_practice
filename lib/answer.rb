class Answer

  # Test # 1
  # Insertion sort is a simple sorting algorithm that
  # builds the final sorted array (or list) one item
  # at a time. Implement the insertion sort alogorithm
  # below.
  #
  # Questions:
  # 1) What's the best case scenario?
  # 2) What's the worst case scenario?

  def self.insertion_sort(items)
    len = items.length
    i = 0
    if len > 1
      while i <= len - 1
        val = items[i]
        n = i - 1
        while n >= 0
          #puts "current: #{val}, comp: #{items[n]}"
          if val < items[n]
            #puts "swap #{val} for #{items[n]}"
            # swap
            tmp = items[n]
            items[n] = items[n+1]
            items[n+1] = tmp
          else
            break
          end
          n -= 1
        end
        i += 1
      end
    end
    return items
  end


  # Test # 2
  # Bubble sort is a simple sorting algorithm that
  # compares adjacent elements of the sequence. If they are
  # in the wrong order, then swap them. Then use recursion
  # to loop through the array again, until there are
  # no more swappings to do.
  #
  # Questions:
  # 1) What's the efficiency of this algorithm?

  def self.bubble_sort(items)
    if items.length > 0
      while true
        swapped = false
        items.each_with_index do |num, i|
          if i > 0
            l = items[i-1]
            r = items[i]
            if r < l
              # swap
              tmp = items[i]
              items[i] = items[i-1]
              items[i-1] = tmp
              swapped = true
            end
          end
        end
        break if !swapped
      end
    end
    return items
  end

  # Test # 2
  # Quick Sort
  # Quicksort is a divide and conquer algorithm in the style of
  # merge sort. The basic idea is to find a "pivot" item in the
  # rray to compare all other items against, then shift items
  # such that all of the items before the pivot are less than the
  # pivot value and all the items after the pivot are greater
  # than the pivot value. After that, recursively perform the
  # same operation on the items before and after the pivot.
  #
  def self.quick_sort(items, left, right)

  end


  # Write a program that prints the numbers from 1 to 100.
  # But for multiples of three print "Fizz" instead of the
  # number and for the multiples of five print "Buzz". For
  # numbers which are multiples of both three and five
  # print "FizzBuzz".
  #
  # In this example, rather than printing the results, return
  # an array of the results instead.

  def self.fizz_buzz

  end



  # This example retrieves a set of data from the
  # Twitter API. Take the result of it and return an
  # an array of hashes that meets the following criteria:
  #
  # The initial 'data' response from twitter is
  # of type <Net::HTTPOK>, s
  #
  # - has the following properties:
  #   - 'username'
  #   - 'created_at'
  #   - 'body' of the tweet, with the text "WunWun"
  #     tacked-on to the end of the body
  # - ordered (Ascending) follower count of user who posted

  require "#{Dir.pwd}/lib/twitter_api.rb"
  require 'net/http'
  require 'net/https'
  require 'cgi'
  require 'openssl'
  require 'base64'
  require 'json'

  def self.parse_twitter_response

    response = TwitterApi.get_twitter_response

    arr = []

    # your code here

    return arr

  end

end

