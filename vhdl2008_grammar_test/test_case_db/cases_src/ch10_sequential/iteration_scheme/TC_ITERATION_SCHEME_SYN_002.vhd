-- =============================================================
-- Case ID: TC_ITERATION_SCHEME_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ITERATION_SCHEME
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: iteration_scheme ::= while condition | for parameter_specification
-- Case Type: Positive
-- Test Focus: minimal while condition: while cnt < 10 loop — a standalone while iteration_scheme controls a simple counting loop
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity iter_syn2_ent is port(start:in bit; y:out integer); end entity;
architecture bh of iter_syn2_ent is
begin
  process(start) is
    variable v_cnt : integer := 0;
  begin
    v_cnt := 0;
    while v_cnt < 10 loop
      v_cnt := v_cnt + 1;
    end loop;
    y <= v_cnt;
  end process;
end architecture bh;
