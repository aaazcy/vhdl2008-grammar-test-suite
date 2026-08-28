-- =============================================================
-- Case ID: TC_RETURN_STATEMENT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_RETURN_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.6
-- Production: return_statement ::= [ label : ] return [ expression ] ;
-- Case Type: Negative
-- Test Focus: SNN: Function return missing expression — `return;` (without expression) appearing in a function body; a function return must include an expression (unless the return type is void/none), verifying that return in a function context requires an expression
-- Expected Result: Triggers syntax/semantic error: function return requires expression
-- Dependencies: None
-- =============================================================
entity ret_snn1_ent is port(a:in integer; y:out integer); end entity;
architecture bh of ret_snn1_ent is
  function f_bad(x:integer) return integer is
  begin return; end function;
begin y<=f_bad(a); end architecture bh;
