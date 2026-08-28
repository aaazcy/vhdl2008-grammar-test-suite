-- =============================================================
-- Case ID: TC_INSTANTIATION_LIST_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_INSTANTIATION_LIST
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: instantiation_list ::= instantiation_label { , instantiation_label } | others | all
-- Case Type: Positive
-- Test Focus: instantiation_list "others" with multiple component types -- exercises "for others : comp" where the "others" keyword binds all remaining unbound instances of a specific component type, with a different component using "all" for contrast; tests that "others" scopes correctly per component type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gate_and2 is
  port (a, b : in bit; y : out bit);
end entity gate_and2;

architecture beh of gate_and2 is
begin
end architecture beh;

entity gate_xor2 is
  port (a, b : in bit; y : out bit);
end entity gate_xor2;

architecture beh of gate_xor2 is
begin
end architecture beh;

entity il_others_scope is
  port(
    clk   : in  bit;
    d     : in  bit_vector(1 downto 0);
    q_xor : out bit;
    q_and : out bit
  );
end entity;

architecture structural of il_others_scope is
  component gate_xor2 is
    port(a, b : in bit; y : out bit);
  end component;
  component gate_and2 is
    port(a, b : in bit; y : out bit);
  end component;

  -- "all" for xor gates: binds every xor instance
  for all : gate_xor2
    use entity work.gate_xor2(beh)
    port map(a => '0', b => '0', y => open);

  -- "others" for and gates: binds remaining unnamed and instances
  for others : gate_and2
    use entity work.gate_and2(beh)
    port map(a => '0', b => '0', y => open);

  signal s0, s1 : bit := '0';
begin
  u_xor : gate_xor2
    port map(a => d(0), b => d(1), y => s0);
  u_and : gate_and2
    port map(a => d(0), b => d(1), y => s1);
  q_xor <= s0;
  q_and <= s1;
end architecture structural;
