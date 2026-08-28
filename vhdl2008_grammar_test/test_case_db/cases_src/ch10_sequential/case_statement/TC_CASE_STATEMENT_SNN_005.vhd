-- =============================================================
-- Case ID: TC_CASE_STATEMENT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: case_statement ::= [ case_label : ] case expression is case_statement_alternative { case_statement_alternative } end case [ case_label ] ;
-- Case Type: Negative
-- Test Focus: SNN: type mismatch between case expression (integer) and a choice value that uses an enumeration literal from a different type — one choice tries to reference an enum value that does not belong to the expression's type domain, verifying that every choice in a choice list must be a legal member of the case expression's type
-- Expected Result: Triggers syntax/semantic error: choice type does not match case expression type
-- Dependencies: None
-- =============================================================
entity case_typemm_ent is
  port(sel:in integer range 0 to 3; y:out integer);
end entity;
architecture bh of case_typemm_ent is
  type t_op is (IDLE, READ, WRITE, FLUSH);
  signal s_op:t_op:=IDLE;
begin
  process(sel) is
  begin
    case sel is
      when 0 => s_op<=IDLE;   y<=0;
      when 1 => s_op<=READ;    y<=10;
      when 2 => s_op<=WRITE;   y<=20;
      when IDLE => s_op<=FLUSH; y<=30;
    end case;
  end process;
end architecture bh;
