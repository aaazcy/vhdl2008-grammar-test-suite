-- =============================================================
-- Case ID: TC_COMPOSITE_TYPE_DEFINITION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_COMPOSITE_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.1
-- Production: composite_type_definition ::= array_type_definition
--              | record_type_definition
-- Case Type: Positive
-- Test Focus: Multidimensional array_type_definition within
--            composite_type_definition. A 2D convolution kernel
--            for image processing.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity conv2d_kernel_3x3 is
  port (
    pixel_in   : in  integer range 0 to 255;
    row        : in  integer range 0 to 2;
    col        : in  integer range 0 to 2;
    coeff      : out integer range -8 to 8
  );
end entity conv2d_kernel_3x3;

architecture rtl of conv2d_kernel_3x3 is
  -- composite_type_definition: 2D array_type_definition
  type kernel_3x3 is array (0 to 2, 0 to 2) of integer range -8 to 8;
  constant sobel_x : kernel_3x3 := (
    (0 => -1, 1 =>  0, 2 =>  1),
    (0 => -2, 1 =>  0, 2 =>  2),
    (0 => -1, 1 =>  0, 2 =>  1)
  );
  signal pixel_val : integer range 0 to 255;
begin
  pixel_val <= pixel_in;
  coeff <= sobel_x(row, col);
end architecture rtl;
