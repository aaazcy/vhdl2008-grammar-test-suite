-- =============================================================
-- Case ID: TC_UNBOUNDED_ARRAY_DEFINITION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_UNBOUNDED_ARRAY_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: unbounded_array_definition ::=
--   array ( index_subtype_definition { , index_subtype_definition } )
--   of element_subtype_indication
-- Case Type: Positive
-- Test Focus: 2D unbounded array with two index_subtype_definitions
--            using different type_marks (integer, natural).
--            A 2D coefficient matrix for image convolution.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity conv_coeff_matrix is
  port (
    row   : in  integer range 0 to 2;
    col   : in  integer range 0 to 2;
    coeff : out integer range -8 to 8
  );
end entity conv_coeff_matrix;

architecture rtl of conv_coeff_matrix is
  -- unbounded_array_definition: 2 index_subtype_definitions
  type coeff_matrix is array (integer range <>, natural range <>)
    of integer range -8 to 8;
  subtype kernel_3x3 is coeff_matrix(0 to 2, 0 to 2);
  constant gaussian_blur : kernel_3x3 := (
    (0 => 1, 1 => 2, 2 => 1),
    (0 => 2, 1 => 4, 2 => 2),
    (0 => 1, 1 => 2, 2 => 1)
  );
begin
  coeff <= gaussian_blur(row, col);
end architecture rtl;
