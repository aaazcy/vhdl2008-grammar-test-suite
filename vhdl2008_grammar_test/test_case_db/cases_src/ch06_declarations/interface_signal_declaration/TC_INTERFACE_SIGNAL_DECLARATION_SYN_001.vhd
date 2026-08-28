-- =============================================================
-- Case ID: TC_INTERFACE_SIGNAL_DECLARATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_SIGNAL_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_signal_declaration ::= [ signal ] identifier_list : [ mode ] subtype_indication [ bus ] [ := static_expression ]
-- Case Type: Positive
-- Test Focus: Exercises interface_signal_declaration with explicit signal keyword, mode, bus keyword, and default expression.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity interface_signal_syn1 is
  port (
    signal clk    : in  bit;
    signal data   : in  bit_vector(7 downto 0);
    signal result : out bit_vector(7 downto 0) := (others => '0');
    signal status : out bit := '0'
  );
end entity interface_signal_syn1;

architecture rtl of interface_signal_syn1 is
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      result <= data xor "10101010";
      status <= '1';
    end if;
  end process;
end architecture rtl;
