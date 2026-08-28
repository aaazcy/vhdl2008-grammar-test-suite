-- =============================================================
-- Case ID: TC_ARCHITECTURE_DECLARATIVE_PART_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_declarative_part ::= { block_declarative_item }
-- Case Type: Positive
-- Test Focus: Group declarations + template: declarative part contains group_template_declaration (defining a signal+signal combination) + group_declaration (naming clk+d as g_sync) + attribute specification on group, verifying complete use of group/group_template declarative items in the architecture declarative part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity adp_group_ent is port(clk,d:in bit; q:out bit); end entity;
architecture bh of adp_group_ent is
  group sync_sigs is (signal, signal);
  signal s_clk,s_d,s_q:bit:='0';
  group g_sync:sync_sigs(s_clk,s_d);
  attribute keep:string;
  attribute keep of g_sync:group is "true";
begin
  s_clk<=clk; s_d<=d;
  process(s_clk) begin if s_clk'event and s_clk='1' then s_q<=s_d; end if; end process;
  q<=s_q;
end architecture bh;
