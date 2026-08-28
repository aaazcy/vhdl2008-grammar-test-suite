-- =============================================================
-- Case ID: TC_DIRECTION_SMN_001
-- Related Rule ID: SMN_DIRECTIO_001
-- Rule Type: Semantic (Negative)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: direction ::= to | downto
-- Test Focus: Runtime semantic issue: using "to" direction in array
--   slicing when the array was declared with "downto". The slice
--   direction must match the declaration direction. Using a null
--   slice (7 to 0) on a downto-declared array produces a null slice.
-- Expected Result: Compiles; simulation warning about null slice
-- Dependencies: None
-- =============================================================
entity direction_slice_mismatch is
  port (
    data_in  : in  bit_vector(7 downto 0);
    data_out : out bit_vector(7 downto 0)
  );
end entity direction_slice_mismatch;

architecture slice_dir_warning of direction_slice_mismatch is
begin
  -- Array declared 7 downto 0, but sliced 6 to 0: direction mismatch
  -- This slice is null (6 to 0 on a downto array)
  data_out(7) <= data_in(7);
  data_out(6 to 0) <= data_in(6 to 0);
end architecture slice_dir_warning;
