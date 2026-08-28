-- =============================================================
-- Case ID: TC_ARCHITECTURE_BODY_SYN_011
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_BODY
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_body ::= architecture identifier of entity_name is architecture_declarative_part begin architecture_statement_part end [ architecture ] [ architecture_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Unconstrained port + generic combination: entity uses an unconstrained array port and a generic to control size, the declarative part derives the index range from the generic value, for-generate iterates the generic parameter, verifying full architecture support for generics and unconstrained ports
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity arch_uc_ent is
  generic(N:integer:=8);
  port(din:in bit_vector; dout:out bit_vector(N-1 downto 0));
end entity;
architecture rtl of arch_uc_ent is
  subtype t_word is bit_vector(N-1 downto 0);
  signal s_reg:t_word:=(others=>'0');
begin
  gen_reg:for i in 0 to N-1 generate
    s_reg(i)<=din(i);
  end generate;
  dout<=s_reg;
end architecture rtl;
