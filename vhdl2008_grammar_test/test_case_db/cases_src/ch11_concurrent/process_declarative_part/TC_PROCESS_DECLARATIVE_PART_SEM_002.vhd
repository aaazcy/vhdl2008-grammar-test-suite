-- =============================================================
-- Case ID: TC_PROCESS_DECLARATIVE_PART_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_PROCESS_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_declarative_part ::= { process_declarative_item }
-- Rule Description: Items declared in a process declarative part are local to that process; identically named items in different processes are distinct objects with no interaction
-- Case Type: Positive
-- Test Focus: Same-named variables independent in different processes——proc_a and proc_b each declare `variable v_local : integer`, verifying that same-named declarations in the two processes are separate objects that do not affect each other
-- Expected Result: Compiles successfully; each process has its own independent variables
-- Dependencies: None
-- =============================================================
entity pdp_sem2_ent is
  port(clk : in bit; a, b : in integer; ya, yb : out integer);
end entity pdp_sem2_ent;
architecture bh of pdp_sem2_ent is
begin
  proc_a : process(clk) is
    variable v_local : integer := 0;
  begin
    if clk'event and clk = '1' then
      v_local := v_local + a;
      ya <= v_local;
    end if;
  end process proc_a;
  proc_b : process(clk) is
    variable v_local : integer := 100;
  begin
    if clk'event and clk = '1' then
      v_local := v_local - b;
      yb <= v_local;
    end if;
  end process proc_b;
end architecture bh;
