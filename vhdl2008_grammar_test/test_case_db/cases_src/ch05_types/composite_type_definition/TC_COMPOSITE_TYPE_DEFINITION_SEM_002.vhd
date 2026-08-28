-- =============================================================
-- Case ID: TC_COMPOSITE_TYPE_DEFINITION_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_COMPOSITE_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.1
-- Production: composite_type_definition ::= array_type_definition
--              | record_type_definition
-- Case Type: Positive
-- Test Focus: Semantic: record_type_definition for a color pixel
--            with RGB channels. The record is used in a video
--            stream processor. Composite records with constrained
--            integer channels.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity rgb_pixel_processor is
  port (
    r_in  : in  integer range 0 to 255;
    g_in  : in  integer range 0 to 255;
    b_in  : in  integer range 0 to 255;
    gray  : out integer range 0 to 255
  );
end entity rgb_pixel_processor;

architecture rtl of rgb_pixel_processor is
  type rgb_pixel is record
    red   : integer range 0 to 255;
    green : integer range 0 to 255;
    blue  : integer range 0 to 255;
  end record;
  signal pixel : rgb_pixel;
  function to_grayscale (p : rgb_pixel) return integer is
    variable lum : integer;
  begin
    lum := (p.red * 77 + p.green * 150 + p.blue * 29) / 256;
    return lum;
  end function;
begin
  pixel.red <= r_in; pixel.green <= g_in; pixel.blue <= b_in;
  gray <= to_grayscale(pixel);
end architecture rtl;
