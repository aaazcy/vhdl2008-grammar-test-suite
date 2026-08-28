-- =============================================================
-- Case ID: TC_ELEMENT_DECLARATION_SYN_003
-- Rule Type: Syntax
-- BNF Production: ELEMENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: element_declaration ::=
--   identifier_list : element_subtype_definition ;
-- Test Focus: Record types with multi-identifier element
--   declarations (comma-separated identifier_list) and
--   array-type elements — exercises the full identifier_list
--   grammar with multiple identifiers sharing the same
--   element_subtype_definition
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity element_declaration_syn_003 is
  port (
    clk       : in  bit;
    rst_n     : in  bit;
    pixel_in  : in  bit_vector(7 downto 0);
    hsync_in  : in  bit;
    vsync_in  : in  bit;
    pixel_out : out bit_vector(7 downto 0);
    hsync_out : out bit;
    vsync_out : out bit
  );
end entity element_declaration_syn_003;

architecture rtl of element_declaration_syn_003 is
  -- Multi-identifier element: r, g, b share same subtype
  type t_rgb_pixel is record
    r, g, b    : bit_vector(7 downto 0);        -- ELEMENT_DECLARATION: comma list
  end record;

  -- Multi-identifier element with constrained integer
  type t_video_timing is record
    h_active, v_active   : integer range 0 to 2047;  -- ELEMENT_DECLARATION
    h_total, v_total     : integer range 0 to 4095;  -- ELEMENT_DECLARATION
    h_sync, v_sync       : integer range 0 to 255;   -- ELEMENT_DECLARATION
  end record;

  -- Array-type elements
  type t_line_buffer is record
    pixels : bit_vector(0 to 1023);              -- ELEMENT_DECLARATION: array type
    count  : integer range 0 to 1023;            -- ELEMENT_DECLARATION
    full   : bit;                                 -- ELEMENT_DECLARATION
  end record;

  signal s_pixel_in  : t_rgb_pixel;
  signal s_pixel_out : t_rgb_pixel;
  signal s_timing    : t_video_timing;
  signal s_line_buf  : t_line_buffer;
  signal s_hsync_d1  : bit := '0';
  signal s_vsync_d1  : bit := '0';
begin
  -- Map input to RGB (grayscale: same value on all channels)
  s_pixel_in.r <= pixel_in;
  s_pixel_in.g <= pixel_in;
  s_pixel_in.b <= pixel_in;

  -- Configure timing parameters
  s_timing.h_active <= 800;
  s_timing.v_active <= 600;
  s_timing.h_total  <= 1056;
  s_timing.v_total  <= 628;
  s_timing.h_sync   <= 128;
  s_timing.v_sync   <= 4;

  -- Pipeline register
  process(clk, rst_n)
  begin
    if rst_n = '0' then
      s_pixel_out.r <= (others => '0');
      s_pixel_out.g <= (others => '0');
      s_pixel_out.b <= (others => '0');
      s_hsync_d1    <= '0';
      s_vsync_d1    <= '0';
    elsif clk'event and clk = '1' then
      s_pixel_out.r <= s_pixel_in.r;
      s_pixel_out.g <= s_pixel_in.g;
      s_pixel_out.b <= s_pixel_in.b;
      s_hsync_d1    <= hsync_in;
      s_vsync_d1    <= vsync_in;
    end if;
  end process;

  pixel_out <= s_pixel_out.r;
  hsync_out <= s_hsync_d1;
  vsync_out <= s_vsync_d1;
end architecture rtl;
