-- =============================================================
-- Case ID: TC_ARCHITECTURE_BODY_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_BODY
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_body ::= architecture identifier of entity_name is architecture_declarative_part begin architecture_statement_part end [ architecture ] [ architecture_simple_name ] ;
-- Case Type: Positive
-- Test Focus: same entity dual architectures: structural vs behavioral style
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity arch_multi_ent is port(a,b:in bit; y:out bit); end entity;
architecture structural of arch_multi_ent is
  component and_gate is port(x1,x2:in bit; z:out bit); end component;
  signal s_and:bit;
begin
  u_and:and_gate port map(x1=>a,x2=>b,z=>s_and); y<=s_and;
end architecture structural;
architecture behavioral of arch_multi_ent is
begin
  process(a,b) begin if a='1' and b='1' then y<='1'; else y<='0'; end if; end process;
end architecture behavioral;
