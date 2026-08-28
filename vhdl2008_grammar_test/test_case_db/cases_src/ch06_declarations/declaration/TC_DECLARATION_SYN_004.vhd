-- =============================================================
-- Case ID: TC_DECLARATION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.1
-- Production: declaration ::= type_declaration | subtype_declaration | object_declaration | interface_declaration | alias_declaration | attribute_declaration | component_declaration | group_template_declaration | group_declaration | ...
-- Case Type: Positive
-- Test Focus: Exercises declaration via alias_declaration path with signal slice aliases for data deinterleaving.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity declaration_syn4 is
  port (
    clk  : in  bit;
    data : in  bit_vector(15 downto 0);
    lo   : out bit_vector(7 downto 0);
    hi   : out bit_vector(7 downto 0)
  );
end entity declaration_syn4;

architecture rtl of declaration_syn4 is
  signal s_data : bit_vector(15 downto 0) := (others => '0');
  alias a_lo_byte : bit_vector(7 downto 0) is s_data(7 downto 0);
  alias a_hi_byte : bit_vector(7 downto 0) is s_data(15 downto 8);
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      s_data <= data;
      lo <= a_lo_byte;
      hi <= a_hi_byte;
    end if;
  end process;
end architecture rtl;
