-- =============================================================
-- Case ID: TC_ARCHITECTURE_BODY_SYN_012
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_BODY
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_body ::= architecture identifier of entity_name is architecture_declarative_part begin architecture_statement_part end [ architecture ] [ architecture_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Multi-level configuration binding: architecture declarative part contains component declaration + configuration specification (for...use entity...port map) and instantiates that component, verifying architecture_declarative_part can contain a configuration specification whose binding takes effect at architecture instantiation
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_and is
  port (x1,x2:in bit; z:out bit);
end entity gate_and;

architecture rtl of gate_and is
begin
end architecture rtl;

entity gate_or is
  port (x1,x2:in bit; z:out bit);
end entity gate_or;

architecture beh of gate_or is
begin
end architecture beh;

entity arch_cfg_ent is
  port(a,b:in bit; y_and,y_or:out bit);
end entity;
architecture structural of arch_cfg_ent is
  component gate_and is port(x1,x2:in bit; z:out bit); end component;
  component gate_or  is port(x1,x2:in bit; z:out bit); end component;
  for u_and:gate_and use entity work.gate_and(rtl) port map(x1=>x1,x2=>x2,z=>z);
  for u_or:gate_or  use entity work.gate_or(beh)  port map(x1=>x1,x2=>x2,z=>z);
  signal s_and,s_or:bit;
begin
  u_and:gate_and port map(x1=>a,x2=>b,z=>s_and);
  u_or:gate_or   port map(x1=>a,x2=>b,z=>s_or);
  y_and<=s_and; y_or<=s_or;
end architecture structural;
