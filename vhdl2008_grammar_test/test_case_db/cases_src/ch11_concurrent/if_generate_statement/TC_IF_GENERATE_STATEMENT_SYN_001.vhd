-- =============================================================
-- Case ID: TC_IF_GENERATE_STATEMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_IF_GENERATE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.8
-- Production: if_generate_statement ::= generate_label : if condition generate generate_statement_body { elsif condition generate generate_statement_body } [ else generate generate_statement_body ] end generate [ generate_label ] ;
-- Case Type: Positive
-- Test Focus: If-generate-elsif-else with all branches: 3 branches (if G_MODE=0 / elsif G_MODE=1 / else), each generating a different concurrent statement (component inst / concurrent assign / block), verifying that if-generate supports elsif and else branches and each branch can contain any concurrent_statement
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ig_ent is
  generic(G_MODE:integer:=0);
  port(a,b:in bit; y:out bit);
end entity;
architecture bh of ig_ent is
  component and2 is port(x1,x2:in bit; z:out bit); end component;
  component or2  is port(x1,x2:in bit; z:out bit); end component;
begin
  gen_mode:if G_MODE=0 generate
    u_and:and2 port map(x1=>a,x2=>b,z=>y);
  elsif G_MODE=1 generate
    u_or:or2 port map(x1=>a,x2=>b,z=>y);
  else generate
    y<=a xor b;
  end generate gen_mode;
end architecture bh;
