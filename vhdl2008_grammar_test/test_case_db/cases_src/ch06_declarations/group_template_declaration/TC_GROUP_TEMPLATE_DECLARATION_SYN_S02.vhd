-- =============================================================
-- Case ID: TC_GROUP_TEMPLATE_DECLARATION_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_GROUP_TEMPLATE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.9
-- Production: group_template_declaration ::= group identifier is ( entity_class_entry_list ) ;
-- Case Type: Positive
-- Test Focus: Production-specific: exercises group_template_declaration defining a template for signal+variable groups.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity group_template_decl_syn_s2 is
  port (
    clk   : in  bit;
    d     : in  bit_vector(3 downto 0);
    q     : out bit_vector(3 downto 0)
  );
end entity group_template_decl_syn_s2;

architecture rtl of group_template_decl_syn_s2 is
  group mixed_group is (signal, signal);
  signal s_d, s_q : bit_vector(3 downto 0);
  group g_reg : mixed_group (s_d, s_q);
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      s_d <= d;
      s_q <= s_d;
    end if;
  end process;
  q <= s_q;
end architecture rtl;
