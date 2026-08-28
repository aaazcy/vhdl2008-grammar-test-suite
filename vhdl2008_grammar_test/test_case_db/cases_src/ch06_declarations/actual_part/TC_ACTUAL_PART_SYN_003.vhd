-- =============================================================
-- Case ID: TC_ACTUAL_PART_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ACTUAL_PART
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: actual_part ::= actual_designator
--              | function_name ( actual_designator )
--              | type_mark ( actual_designator )
-- Case Type: Positive (Production-Specific)
-- Test Focus: actual_part — exercises the type_mark(actual_designator)
--             alternative (type conversion) in component port maps.
--             Shows bit_vector(signal) and integer(signal) conversions.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity actual_part_syn3 is
  port (
    clk       : in  bit;
    raw_data  : in  bit_vector(7 downto 0);
    processed : out integer range 0 to 255
  );
end entity actual_part_syn3;

architecture arch of actual_part_syn3 is

  component data_buffer is
    port (
      clock    : in  bit;
      input    : in  integer;
      output   : out integer
    );
  end component;

  component byte_splitter is
    port (
      byte_in  : in  bit_vector(7 downto 0);
      nib_hi   : out bit_vector(3 downto 0);
      nib_lo   : out bit_vector(3 downto 0)
    );
  end component;

  signal s_int_val  : integer range 0 to 255 := 0;
  signal s_buf_out  : integer range 0 to 255 := 0;
  signal s_nib_hi   : bit_vector(3 downto 0);
  signal s_nib_lo   : bit_vector(3 downto 0);

begin

  -- actual_part = type_mark(actual_designator):
  --   integer(s_int_val) converts the signal via the integer subtype
  u_buf : component data_buffer
    port map (
      clock  => clk,
      input  => integer(s_int_val),
      output => s_buf_out
    );

  -- Another type_mark usage: the splitter uses bit_vector ports
  u_split : component byte_splitter
    port map (
      byte_in  => bit_vector(raw_data),
      nib_hi   => s_nib_hi,
      nib_lo   => s_nib_lo
    );

  processed <= s_buf_out;

end architecture arch;
