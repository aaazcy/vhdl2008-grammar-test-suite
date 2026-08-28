-- =============================================================
-- Case ID: TC_BINDING_INDICATION_SEM_001
-- Related Rule ID: SEM_BINDING_001
-- Rule Type: Semantic
-- BNF Production: BINDING_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.2.1
-- Production: binding_indication ::= [ use entity_aspect ] [ generic_map_aspect ] [ port_map_aspect ]
-- Case Type: Positive (Semantic)
-- Test Focus: Semantic binding with generic override and port mapping — verifies that binding_indication correctly binds a component to an entity with architecture selection, generic value override, and named port association
-- Expected Result: Compiles successfully; binding semantics verified
-- Dependencies: None
-- =============================================================
entity dff_reg is
  generic (W : integer := 8; INIT : bit := '0');
  port (clk : in bit; d : in bit; q : out bit);
end entity dff_reg;

architecture beh of dff_reg is
begin
end architecture beh;

entity bi_sem_generic is
  port(clk,d : in bit; q : out bit);
end entity;

architecture bh of bi_sem_generic is
  component dff_reg is
    generic(W : integer := 8; INIT : bit := '0');
    port(clk : in bit; d : in bit; q : out bit);
  end component;
  for u_dff : dff_reg use entity work.dff_reg(beh)
    generic map(W => 1, INIT => '1')
    port map(clk => clk, d => d, q => q);
  function f_not(x:bit) return bit is begin return not x; end function;
  signal s_nq : bit;
begin
  u_dff : dff_reg port map(clk => clk, d => d, q => q);
  s_nq <= f_not(q);
end architecture bh;
