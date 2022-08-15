= HHaasshh..mmiinn__bbyy

(from ruby core)
=== IImmpplleemmeennttaattiioonn  ffrroomm  EEnnuummeerraabbllee
------------------------------------------------------------------------
  enum.min_by {|obj| block }      -> obj
  enum.min_by                     -> an_enumerator
  enum.min_by(n) {|obj| block }   -> array
  enum.min_by(n)                  -> an_enumerator

------------------------------------------------------------------------

Returns the object in _e_n_u_m that gives the minimum value from the
given block.

If no block is given, an enumerator is returned instead.

  a = %w(albatross dog horse)
  a.min_by { |x| x.length }   #=> "dog"

If the n argument is given, minimum n elements are returned as an array.
These n elements are sorted by the value from the given block.

  a = %w[albatross dog horse]
  p a.min_by(2) {|x| x.length } #=> ["dog", "horse"]


