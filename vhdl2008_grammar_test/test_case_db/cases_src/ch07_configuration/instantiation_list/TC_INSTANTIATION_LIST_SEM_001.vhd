-- =============================================================
-- Case ID: TC_INSTANTIATION_LIST_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_INSTANTIATION_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: instantiation_list ::= instantiation_label { , instantiation_label } | others | all
-- Case Type: Positive (Semantic)
-- Test Focus: Semantic resolution of instantiation_list where "others" scopes to unbound instances after some are explicitly bound -- verifies that "for others : comp use ..." correctly binds only the instances not covered by the explicit "for u_a, u_b : comp" specification; tests the semantic layering and priority of configuration specifications
-- Expected Result: Compiles successfully; explicit bindings take priority over "others"
-- Dependencies: None
-- =============================================================
entity flipflop is
  port (clock : in bit; data : in bit; q_out : out bit);
end entity flipflop;

architecture fast_arch of flipflop is
begin
end architecture fast_arch;

entity il_sem_binding is
  port(
    clk   : in  bit;
    d     : in  bit;
    q0    : out bit;
    q1    : out bit;
    q2    : out bit
  );
end entity;

architecture structural of il_sem_binding is
  component flipflop is
    port(clock : in bit; data : in bit; q_out : out bit);
  end component;

  -- Explicit binding for first two instances
  for u_ff0, u_ff1 : flipflop
    use entity work.flipflop(fast_arch)
    port map(clock => clk, data => d, q_out => open);

  -- "others" binds the remaining instance u_ff2 with a different architecture
  for others : flipflop
    use entity work.flipflop(slow_arch)
    port map(clock => clk, data => d, q_out => open);

  signal s0, s1 : bit := '0';
begin
  u_ff0 : flipflop
    port map(clock => clk, data => d, q_out => s0);
  u_ff1 : flipflop
    port map(clock => clk, data => s0, q_out => s1);
  u_ff2 : flipflop
    port map(clock => clk, data => s1, q_out => q2);
  q0 <= s0;
  q1 <= s1;
end architecture structural;
