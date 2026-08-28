-- =============================================================
-- Case ID: TC_ARRAY_ELEMENT_CONSTRAINT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_ELEMENT_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_element_constraint ::= element_constraint
-- Case Type: Positive
-- Test Focus: Nested array_element_constraint: array of arrays where
--            each element is itself a constrained array. Tests that
--            element_constraint chains through array_constraint
--            recursively in a pixel buffer context.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pixel_line_buffer is
  port (
    pixel_in   : in  integer range 0 to 255;
    line_sel   : in  integer range 0 to 3;
    pix_sel    : in  integer range 0 to 7;
    pixel_out  : out integer range 0 to 255
  );
end entity pixel_line_buffer;

architecture rtl of pixel_line_buffer is
  -- array_element_constraint: element is constrained to byte range
  subtype pixel_byte is integer range 0 to 255;
  -- nested: array of constrained pixel rows
  type pixel_row is array (0 to 7) of pixel_byte;
  type line_buffer is array (0 to 3) of pixel_row;
  signal buf : line_buffer := (others => (others => 0));
begin
  buf(line_sel)(pix_sel) <= pixel_in;
  pixel_out <= buf(line_sel)(pix_sel);
end architecture rtl;
