-- =============================================================
-- Case ID: TC_ELEMENT_SUBTYPE_DEFINITION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_SUBTYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_subtype_definition ::= subtype_indication
-- Case Type: Positive
-- Test Focus: element_subtype_definition for 2D array elements.
--            A grayscale image thumbnail stored as a constrained
--            8x8 2D pixel array with element_subtype_definition
--            for pixel intensity.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity grayscale_thumbnail is
  port (
    row     : in  integer range 0 to 7;
    col     : in  integer range 0 to 7;
    pix_in  : in  integer range 0 to 255;
    pix_out : out integer range 0 to 255
  );
end entity grayscale_thumbnail;

architecture rtl of grayscale_thumbnail is
  -- element_subtype_definition: subtype_indication on pixel
  subtype pixel_t is integer range 0 to 255;
  type thumb_row is array (0 to 7) of pixel_t;
  type thumbnail is array (0 to 7) of thumb_row;
  signal img : thumbnail := (others => (others => 0));
begin
  img(row)(col) <= pix_in;
  pix_out <= img(row)(col);
end architecture rtl;
