-- =============================================================
-- Case ID: TC_ALIAS_DECLARATION_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_ALIAS_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.6.1
-- Production: alias_declaration ::= alias alias_designator [ : subtype_indication ] is name [ signature ] ;
-- Case Type: Positive
-- Test Focus: Exercises alias_declaration syntax variant 9 with progressively complex VHDL structures exercising the full BNF production.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity alias_declaration_syn9 is
  port (
    clk  : in  bit;
    data : in  bit_vector(15 downto 0);
    low  : out bit_vector(7 downto 0);
    high : out bit_vector(7 downto 0)
  );
end entity alias_declaration_syn9;

architecture rtl of alias_declaration_syn9 is
  signal s_data : bit_vector(15 downto 0) := (others => '0');
  alias a_low  : bit_vector(7 downto 0) is s_data(7 downto 0);
  alias a_high : bit_vector(7 downto 0) is s_data(15 downto 8);
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      s_data <= data;
      low  <= a_low xor a_high;
      high <= a_high xor a_low;
    end if;
  end process;
end architecture rtl;
