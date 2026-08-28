-- =============================================================
-- Case ID: TC_EXIT_STATEMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXIT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.11
-- Production: exit_statement ::= [ label : ] exit [ loop_label ] [ when condition ] ;
-- Case Type: Positive
-- Test Focus: With loop_label: `exit outer_loop;` - names the outer loop label, verifying exit can jump out of the named outer loop
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity exit_loop_label_ent is
  port (
    search_val : in  integer range 0 to 7;
    found_at   : out integer range 0 to 7
  );
end entity exit_loop_label_ent;

architecture search of exit_loop_label_ent is
  type t_mem is array (0 to 7) of integer range 0 to 7;
  constant C_MEM : t_mem := (0, 3, 1, 7, 2, 5, 4, 6);
begin
  process(search_val) is
    variable v_idx : integer range 0 to 7;
  begin
    v_idx := 0;
    outer_loop: loop
      inner_loop: loop
        if C_MEM(v_idx) = search_val then
          exit outer_loop;
        end if;
        v_idx := v_idx + 1;
        exit inner_loop when v_idx >= 8;
      end loop inner_loop;
      exit outer_loop when v_idx >= 8;
    end loop outer_loop;
    found_at <= v_idx;
  end process;
end architecture search;
