-- =============================================================
-- Case ID: TC_ALIAS_DECLARATION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ALIAS_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.6.1
-- Production: alias_declaration ::= alias alias_designator [ : subtype_indication ] is name [ signature ] ;
-- Case Type: Positive
-- Test Focus: Exercises alias_declaration with subtype_indication on the alias to create a narrower view of a wider signal.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity alias_decl_syn4 is
  port (
    clk   : in  bit;
    wide  : in  bit_vector(15 downto 0);
    low   : out bit_vector(7 downto 0);
    high  : out bit_vector(7 downto 0)
  );
end entity alias_decl_syn4;

architecture rtl of alias_decl_syn4 is
  signal s_data : bit_vector(15 downto 0) := (others => '0');
  alias a_low_byte : bit_vector(7 downto 0) is s_data(7 downto 0);
  alias a_hi_byte  : bit_vector(7 downto 0) is s_data(15 downto 8);
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      s_data <= wide;
      low  <= a_low_byte;
      high <= a_hi_byte;
    end if;
  end process;
end architecture rtl;
