-- =============================================================
-- Case ID: TC_NEXT_STATEMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_NEXT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.12
-- Production: next_statement ::= [ label : ] next [ loop_label ] [ when condition ] ;
-- Case Type: Positive
-- Test Focus: with loop_label: `next outer_loop;` — specifies the outer loop label, verifying that next can skip an iteration of the outer loop
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity next_loop_label_ent is
  port (
    row_val : in  integer range 0 to 3;
    col_val : in  integer range 0 to 3;
    skip    : out boolean
  );
end entity next_loop_label_ent;

architecture matrix of next_loop_label_ent is
  type t_mat is array (0 to 3, 0 to 3) of integer range 0 to 15;
  signal s_mat : t_mat;
begin
  process(row_val, col_val) is
  begin
    skip <= false;
    row_loop: for r in 0 to 3 loop
      col_loop: for c in 0 to 3 loop
        if s_mat(r, c) = 0 then
          next row_loop;
        end if;
        if r = row_val and c = col_val then
          skip <= true;
        end if;
      end loop col_loop;
    end loop row_loop;
  end process;
end architecture matrix;
