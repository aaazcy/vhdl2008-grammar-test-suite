-- =============================================================
-- Case ID: TC_PROCEDURE_CALL_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCEDURE_CALL
-- Standard Reference: IEEE 1076-2008 Section 10.7
-- Production: procedure_call ::= procedure_name [ ( actual_parameter_part ) ]
-- Case Type: Positive
-- Test Focus: Procedure call mixed named/positional association + no parameters: p_set(signal=>s_val,n) named+positional mix / p_reset parameterless call, verifying that named and positional association in actual_parameter_part can be mixed and empty parameters are also supported
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pc_ent is port(clk:in bit; a:in integer; y:out integer); end entity;
architecture bh of pc_ent is
  procedure p_set(signal v:out integer; n:integer) is begin v<=n; end procedure;
  procedure p_reset(signal v:out integer) is begin v<=0; end procedure;
  signal s_val:integer:=0;
begin
  process(clk) begin
    if clk'event and clk='1' then
      p_set(v=>s_val, n=>a);
      if a<0 then p_reset(v=>s_val); end if;
    end if;
  end process;
  y<=s_val;
end architecture bh;
