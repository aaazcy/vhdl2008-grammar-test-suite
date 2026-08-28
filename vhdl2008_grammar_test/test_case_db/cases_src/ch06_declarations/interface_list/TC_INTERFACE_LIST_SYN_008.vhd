-- =============================================================
-- Case ID: TC_INTERFACE_LIST_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.5.4
-- Production: interface_list ::= interface_element { ; interface_element }
-- Case Type: Positive
-- Test Focus: Exercises interface_list syntax variant 8 with progressively complex VHDL structures exercising the full BNF production.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity interface_list_syn8 is
  port (
    clk   : in  bit;
    d_in  : in  bit_vector(3 downto 0);
    q_out : out bit_vector(3 downto 0);
    valid : out bit
  );
end entity interface_list_syn8;

architecture rtl of interface_list_syn8 is
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
