-- =============================================================
-- Case ID: TC_ENTITY_CLASS_SEM_001
-- Related Rule ID: SEM_ENTITY_C_001
-- Rule Type: Semantic
-- BNF Production: ENTITY_CLASS
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class ::= entity | architecture | configuration | procedure | function | package | type | subtype | constant | signal | variable | component | label | literal | units | group | file | property | sequence
-- Case Type: Positive (Semantic)
-- Test Focus: Semantic distinction of entity_class in a group template - using a group template to define a (signal, architecture) combination, verifying entity_class in a group declaration guides the compiler to look up correspondingly named objects in the correct namespace
-- Expected Result: Compiles successfully; group membership resolved by entity_class semantics
-- Dependencies: None
-- =============================================================
entity gate_and is
  port (x1,x2 : in bit; z : out bit);
end entity gate_and;

architecture rtl of gate_and is
begin
end architecture rtl;

entity ec_sem_group is
  port(a,b : in bit; y : out bit);
end entity;

architecture rtl of ec_sem_group is
  component gate_and is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_and : gate_and use entity work.gate_and(rtl)
    port map(x1=>a, x2=>b, z=>y);
  signal s_fb : bit := '0';
  signal s_strobe : bit := '0';
  attribute timing_info : time;
  attribute timing_info of u_and : label is 3 ns;
  attribute timing_info of s_fb : signal is 1 ns;
  group sig_label_pair is (signal, label);
  group slp : sig_label_pair (s_fb, u_and);
  attribute timing_info of slp : group is 5 ns;
begin
  u_and : gate_and port map(x1=>a, x2=>b, z=>y);
  s_fb <= y;
  s_strobe <= not s_fb after 2 ns;
end architecture rtl;
