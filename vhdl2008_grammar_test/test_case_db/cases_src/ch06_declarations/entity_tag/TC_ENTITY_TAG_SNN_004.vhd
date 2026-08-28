-- =============================================================
-- Case ID: TC_ENTITY_TAG_SNN_004
-- Rule Type: Syntax
-- BNF Production: ENTITY_TAG
-- Standard Reference: IEEE 1076-2008 Section 6.8
-- Production: entity_tag ::=
--   simple_name | character_literal | operator_symbol
-- Test Focus: Missing entity class keyword after entity_tag
--   list — attribute_specification requires
--   attribute_specification ::= attribute attribute_designator
--   of entity_specification is expression ;
--   and entity_specification ::= entity_name_list : entity_class
--   Here the colon before entity_class is replaced with a
--   semicolon, causing parse error
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity entity_tag_snn_004 is
  port (
    clk     : in  bit;
    rst_n   : in  bit;
    q_out   : out bit
  );
end entity entity_tag_snn_004;

architecture rtl of entity_tag_snn_004 is
  attribute syn_preserve : string;
  signal s_ff : bit := '0';

  -- ERROR: missing colon between entity_tag list and entity_class
  -- Should be: attribute syn_preserve of s_ff : signal is "TRUE";
  attribute syn_preserve of s_ff signal is "TRUE";

begin
  process(clk, rst_n)
  begin
    if rst_n = '0' then
      s_ff <= '0';
    elsif clk'event and clk = '1' then
      s_ff <= not s_ff;
    end if;
  end process;
  q_out <= s_ff;
end architecture rtl;
