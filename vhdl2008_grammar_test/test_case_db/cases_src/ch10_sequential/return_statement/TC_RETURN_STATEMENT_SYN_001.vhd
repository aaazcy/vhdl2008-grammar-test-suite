-- =============================================================
-- Case ID: TC_RETURN_STATEMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_RETURN_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.6
-- Production: return_statement ::= [ label : ] return [ expression ] ;
-- Case Type: Positive
-- Test Focus: Return in function (with expression) + return in procedure (without expression): `return v_sum` in function f_sum includes an expression, `return` in procedure p_set has no expression, verifying the two legal forms of return in a function (must include an expression) and in a procedure (must not include an expression)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ret_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of ret_ent is
  function f_sum(x,y:integer) return integer is
    variable v:integer:=0;
  begin v:=x+y; return v; end function;
  procedure p_set(signal v:out integer; n:integer) is
  begin if n<0 then return; end if; v<=n; end procedure;
  signal s_tmp:integer:=0;
begin
  process(a,b) begin
    if a>0 then p_set(s_tmp,f_sum(a,b)); end if;
    y<=s_tmp;
  end process;
end architecture bh;
