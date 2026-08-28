-- =============================================================
-- Case ID: TC_TYPE_DECLARATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_TYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Production: type_declaration ::= full_type_declaration | incomplete_type_declaration
-- Case Type: Positive
-- Test Focus: Exercises type_declaration with physical type for time measurement in a frequency counter.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity type_decl_syn3 is
  port (
    clk_meas : in  bit;
    clk_ref  : in  bit;
    freq_out : out integer
  );
end entity type_decl_syn3;

architecture rtl of type_decl_syn3 is
  type t_frequency is range 0 to 1_000_000_000
    units
      Hz;
      kHz = 1000 Hz;
      MHz = 1000 kHz;
      GHz = 1000 MHz;
    end units;
  signal s_count : integer range 0 to 1000000 := 0;
begin
  process(clk_ref)
  begin
    if clk_ref'event and clk_ref = '1' then
      freq_out <= s_count;
      s_count <= 0;
    end if;
  end process;

  process(clk_meas)
  begin
    if clk_meas'event and clk_meas = '1' then
      s_count <= s_count + 1;
    end if;
  end process;
end architecture rtl;
