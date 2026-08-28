-- =============================================================
-- Case ID: TC_INDEX_SUBTYPE_DEFINITION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_INDEX_SUBTYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: index_subtype_definition ::= type_mark range <>
-- Case Type: Positive
-- Test Focus: Multiple index_subtype_definitions in a 2D
--            unconstrained array. A video frame buffer with
--            variable row and column dimensions.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity video_frame_buffer is
  port (
    clk    : in  bit;
    row    : in  integer range 0 to 3;
    col    : in  integer range 0 to 7;
    pixel  : in  integer range 0 to 255;
    stored : out integer range 0 to 255
  );
end entity video_frame_buffer;

architecture rtl of video_frame_buffer is
  -- Two index_subtype_definitions: integer range <>, integer range <>
  type frame_buf is array (integer range <>, integer range <>) of integer range 0 to 255;
  subtype frame_4x8 is frame_buf(0 to 3, 0 to 7);
  signal fb : frame_4x8 := (others => (others => 0));
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      fb(row, col) <= pixel;
      stored <= fb(row, col);
    end if;
  end process;
end architecture rtl;
