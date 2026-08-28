-- =============================================================
-- Case ID: TC_PORT_LIST_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_PORT_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: port_list ::= port_interface_list
-- Case Type: Positive
-- Test Focus: Exercises port_list syntax variant 6 with progressively complex VHDL structures exercising the full BNF production.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity port_list_syn6 is
  port (
    clk   : in  bit;
    d_in  : in  bit_vector(5 downto 0);
    q_out : out bit_vector(5 downto 0);
    valid : out bit
  );
end entity port_list_syn6;

architecture rtl of port_list_syn6 is
  signal s_reg : bit_vector(5 downto 0) := (others => '0');
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
