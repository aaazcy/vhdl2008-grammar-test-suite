-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATIVE_PART_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_declarative_part ::= { subprogram_declarative_item }
-- Case Type: Negative
-- Test Focus: subprogram_declarative_part: duplicate variable name — the BNF allows repetition of items but each must have a unique identifier; two variables with the same name in the same subprogram declarative region is a semantic error
-- Expected Result: Triggers semantic error: duplicate variable declaration
-- Dependencies: None
-- =============================================================
entity sdp_dup_var is
  port (
    x_in  : in  integer;
    y_out : out integer
  );
end entity;

architecture test of sdp_dup_var is
  function f_process(a : integer) return integer is
    variable v_acc : integer := 0;
    -- ERROR: duplicate variable name v_acc
    -- Each subprogram_declarative_item in { subprogram_declarative_item }
    -- must have a unique identifier
    variable v_acc : integer := 100;
  begin
    v_acc := a + v_acc;
    return v_acc;
  end function;
begin
  y_out <= f_process(x_in);
end architecture test;
