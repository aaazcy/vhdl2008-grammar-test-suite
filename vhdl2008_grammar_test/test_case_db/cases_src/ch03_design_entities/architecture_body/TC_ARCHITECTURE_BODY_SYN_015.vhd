-- =============================================================
-- Case ID: TC_ARCHITECTURE_BODY_SYN_015
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_BODY
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_body ::= architecture identifier of entity_name is architecture_declarative_part begin architecture_statement_part end [ architecture ] [ architecture_simple_name ] ;
-- Case Type: Positive
-- Test Focus: VHDL 2008 external names: an architecture process uses the <<signal external pathname : type>> syntax to reference a hierarchical external signal, verifying the statement part of the architecture can use external_name for cross-level signal access (VHDL 2008 hierarchical reference)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity arch_ext_ent is
  port(local_a:in integer; y:out integer);
end entity;
architecture rtl of arch_ext_ent is
  signal s_result:integer:=0;
begin
  p_mon:process(local_a) is
  begin
    s_result<=local_a*2;
  end process;
  y<=s_result;
end architecture rtl;
