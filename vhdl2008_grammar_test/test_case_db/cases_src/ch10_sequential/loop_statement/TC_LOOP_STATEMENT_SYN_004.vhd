-- =============================================================
-- Case ID: TC_LOOP_STATEMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOOP_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: loop_statement ::= [ loop_label : ] [ iteration_scheme ] loop sequence_of_statements end loop [ loop_label ] ;
-- Case Type: Positive
-- Test Focus: For-loop iterating an enumeration type: uses `for st in t_state loop` to directly iterate the custom enumeration type t_state (IDLE, RUN, WAIT_S, DONE), verifies discrete_range can be an enumeration type name as subtype_indication — iterates all 4 enumeration values and accumulates the weights corresponding to the case branches
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity loop_enum_ent is port(clk:in bit; q:out integer); end entity;
architecture bh of loop_enum_ent is
  type t_state is (IDLE, RUN, WAIT_S, DONE);
  type t_state_vec is array(t_state) of integer;
  signal s_weights:t_state_vec:=(IDLE=>1, RUN=>2, WAIT_S=>4, DONE=>8);
begin
  process(clk)
    variable v_sum:integer:=0;
  begin
    if clk'event and clk='1' then
      v_sum:=0;
      for st in t_state loop
        case st is
          when IDLE  => v_sum:=v_sum+s_weights(st);
          when RUN   => v_sum:=v_sum+s_weights(st);
          when WAIT_S => v_sum:=v_sum+s_weights(st);
          when DONE  => v_sum:=v_sum+s_weights(st);
        end case;
      end loop;
      q<=v_sum;
    end if;
  end process;
end architecture bh;
