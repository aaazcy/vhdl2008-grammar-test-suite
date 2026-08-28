-- =============================================================
-- Case ID: TC_ARCHITECTURE_BODY_SYN_014
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_BODY
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_body ::= architecture identifier of entity_name is architecture_declarative_part begin architecture_statement_part end [ architecture ] [ architecture_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Group declarations: declarative part contains a group_template_declaration (defining the allowed entity class combinations) and a group_declaration (using that template to group signals into a named group), verifying architecture_declarative_part supports the complete group construct (VHDL 2008 group feature)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity arch_group_ent is
  port(clk,data:in bit; q:out bit);
end entity;
architecture rtl of arch_group_ent is
  signal s_clk,s_data,s_q:bit:='0';
  group timing_sigs is (signal, signal);
  group g_clk:timing_sigs(s_clk,s_q);
  attribute keep:string;
  attribute keep of g_clk:group is "true";
begin
  process(s_clk)
  begin
    if s_clk'event and s_clk='1' then s_q<=s_data; end if;
  end process;
  s_clk<=clk; s_data<=data; q<=s_q;
end architecture rtl;
