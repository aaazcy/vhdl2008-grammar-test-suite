-- =============================================================
-- Case ID: TC_BINDING_INDICATION_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_BINDING_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.2.1
-- Production: binding_indication ::= [ use entity_aspect ] [ generic_map_aspect ] [ port_map_aspect ]
-- Case Type: Positive (Semantic)
-- Test Focus: Multiple distinct binding_indication instances in one architecture — verifies that two different components can have independent binding_indication clauses with different entity_aspect, generic_map_aspect, and port_map_aspect configurations, all resolving correctly
-- Expected Result: Compiles successfully; each binding resolves independently
-- Dependencies: None
-- =============================================================
entity gate_and is
  generic (DELAY : time := 1 ns);
  port (x1,x2 : in bit; z : out bit);
end entity gate_and;

architecture rtl of gate_and is
begin
end architecture rtl;

entity gate_or is
  generic (DELAY : time := 2 ns);
  port (x1,x2 : in bit; z : out bit);
end entity gate_or;

architecture beh of gate_or is
begin
end architecture beh;

entity bi_sem_multi is
  port(a,b,c,d : in bit; y1,y2 : out bit);
end entity;

architecture bh of bi_sem_multi is
  component gate_and is
    generic(DELAY : time := 1 ns);
    port(x1,x2 : in bit; z : out bit);
  end component;
  component gate_or is
    generic(DELAY : time := 2 ns);
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_and : gate_and use entity work.gate_and(rtl)
    generic map(DELAY => 500 ps)
    port map(x1=>a, x2=>b, z=>y1);
  for u_or : gate_or use entity work.gate_or(beh)
    generic map(DELAY => 800 ps)
    port map(x1=>c, x2=>d, z=>y2);
  function f_orand(aa,bb,cc,dd : bit) return bit is
  begin return (aa and bb) or (cc and dd); end function;
  signal s_comb : bit;
begin
  u_and : gate_and port map(x1=>a, x2=>b, z=>y1);
  u_or : gate_or port map(x1=>c, x2=>d, z=>y2);
  s_comb <= f_orand(a,b,c,d);
end architecture bh;
