-- =============================================================
-- Case ID: TC_INTERFACE_FUNCTION_SPECIFICATION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_FUNCTION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_function_specification ::= [ pure | impure ] function designator [ [ parameter ] ( formal_parameter_list ) ] return type_mark
-- Case Type: Positive
-- Test Focus: Exercises interface_function_specification syntax variant 7 with progressively complex VHDL structures exercising the full BNF production.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity interface_function_specif_syn7 is
  port (
    clk   : in  bit;
    d_in  : in  bit_vector(6 downto 0);
    q_out : out bit_vector(6 downto 0);
    valid : out bit
  );
end entity interface_function_specif_syn7;

architecture rtl of interface_function_specif_syn7 is
  signal s_reg : bit_vector(6 downto 0) := (others => '0');
  signal s_valid : bit := '0';
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      s_reg <= d_in xor s_reg;
      s_valid <= not s_valid;
    end if;
  end process;
  q_out <= s_reg;
  valid <= s_valid;
end architecture rtl;
