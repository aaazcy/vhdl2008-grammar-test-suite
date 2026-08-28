-- =============================================================
-- Case ID: TC_COMPOUND_CONFIGURATION_SPECIFICATION_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_COMPOUND_CONFIGURATION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.1
-- Production: compound_configuration_specification ::= for component_specification binding_indication ; verification_unit_binding_indication ; { verification_unit_binding_indication ; } end for ;
-- Case Type: Positive (Semantic)
-- Test Focus: Two independent compound configuration specifications in one architecture — verifies that the declarative scope allows multiple "for...end for" compound blocks, each binding a different component type with its own vunit verifications, without cross-interference
-- Expected Result: Compiles successfully; each compound specification resolves independently
-- Dependencies: None
-- =============================================================
entity gate_and is
  port (x1,x2 : in bit; z : out bit);
end entity gate_and;

architecture rtl of gate_and is
begin
end architecture rtl;

entity gate_or is
  port (x1,x2 : in bit; z : out bit);
end entity gate_or;

architecture beh of gate_or is
begin
end architecture beh;

entity ccs_sem_dual is
  port(a,b,c,d : in bit; y1,y2 : out bit);
end entity;

architecture bh of ccs_sem_dual is
  component gate_and is
    port(x1,x2 : in bit; z : out bit);
  end component;
  component gate_or is
    port(x1,x2 : in bit; z : out bit);
  end component;
  for u_and : gate_and use entity work.gate_and(rtl)
    port map(x1=>a, x2=>b, z=>y1);
    use vunit and_property;
  end for;
  for u_or : gate_or use entity work.gate_or(beh)
    port map(x1=>c, x2=>d, z=>y2);
    use vunit or_property;
    use vunit or_cover;
  end for;
  function f_ao(a1,b1,c1,d1 : bit) return bit is
  begin return (a1 and b1) or (c1 and d1); end function;
  signal s_ao : bit;
begin
  u_and : gate_and port map(x1=>a, x2=>b, z=>y1);
  u_or : gate_or port map(x1=>c, x2=>d, z=>y2);
  s_ao <= f_ao(a, b, c, d);
end architecture bh;
