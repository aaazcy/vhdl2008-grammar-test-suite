-- =============================================================
-- Case ID: TC_LOOP_STATEMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOOP_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: loop_statement ::= [ loop_label : ] [ iteration_scheme ] loop sequence_of_statements end loop [ loop_label ] ;
-- Case Type: Positive
-- Test Focus: For-loop iterating a physical type: uses the custom physical type t_delay (three-level units ps/ns/us), verifies discrete_range accepts a range in the form `0 ns to 5 ns` of a physical type, the loop parameter f is a physical type variable, physical division `f / 1 ns` inside the loop body yields universal_integer accumulation
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity loop_phys_ent is port(start:in bit; q:out integer); end entity;
architecture bh of loop_phys_ent is
  type t_delay is range 0 to 1000000 units
    ps; ns=1000 ps; us=1000 ns;
  end units;
begin
  process(start)
    variable v_acc:integer:=0;
    variable v_ns:t_delay:=0 ns;
  begin
    v_acc:=0;
    for f in 0 to 5 loop
      v_ns:=f * 1 ns;
      v_acc:=v_acc + (v_ns / 1 ns);
    end loop;
    q<=v_acc;
  end process;
end architecture bh;
