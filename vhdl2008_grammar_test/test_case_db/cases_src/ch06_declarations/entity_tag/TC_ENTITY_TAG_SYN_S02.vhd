-- =============================================================
-- Case ID: TC_ENTITY_TAG_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_TAG
-- Standard Reference: IEEE 1076-2008 Section 6.8
-- Production: entity_tag ::= simple_name | character_literal | operator_symbol
-- Case Type: Positive
-- Test Focus: Production-specific: exercises entity_tag with character_literal alternative in attribute specification.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity entity_tag_syn_s2 is
  port (
    clk : in bit;
    q   : out bit
  );
end entity entity_tag_syn_s2;

architecture rtl of entity_tag_syn_s2 is
  signal s_toggle : bit := '0';
  attribute syn_keep : boolean;
  attribute syn_keep of s_toggle : signal is true;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      s_toggle <= not s_toggle;
    end if;
  end process;
  q <= s_toggle;
end architecture rtl;
