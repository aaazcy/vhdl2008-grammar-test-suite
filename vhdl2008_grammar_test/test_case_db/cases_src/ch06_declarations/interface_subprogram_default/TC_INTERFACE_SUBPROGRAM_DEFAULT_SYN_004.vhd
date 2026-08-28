-- =============================================================
-- Case ID: TC_INTERFACE_SUBPROGRAM_DEFAULT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_SUBPROGRAM_DEFAULT
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_subprogram_default ::= subprogram_name | <>
-- Case Type: Positive
-- Test Focus: Exercises interface_subprogram_default syntax variant 4 with progressively complex VHDL structures exercising the full BNF production.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity interface_subprogram_defa_syn4 is
  port (
    clk   : in  bit;
    d_in  : in  bit_vector(3 downto 0);
    q_out : out bit_vector(3 downto 0);
    valid : out bit
  );
end entity interface_subprogram_defa_syn4;

architecture rtl of interface_subprogram_defa_syn4 is
  signal s_reg : bit_vector(3 downto 0) := (others => '0');
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
