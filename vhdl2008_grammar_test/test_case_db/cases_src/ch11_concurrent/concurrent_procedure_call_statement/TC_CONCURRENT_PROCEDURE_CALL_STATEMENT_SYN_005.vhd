-- =============================================================
-- Case ID: TC_CONCURRENT_PROCEDURE_CALL_STATEMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_PROCEDURE_CALL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.4
-- Production: concurrent_procedure_call_statement ::= [ label : ] [ postponed ] procedure_call ;
-- Case Type: Positive
-- Test Focus: procedure with multiple in/out parameters — `drive_bus(addr, data, rw, bus_out)` passes 4 parameters of different modes, verifying that a concurrent procedure call supports multi-parameter passing
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cpc_multi_param_ent is
  port(addr : in bit_vector(7 downto 0); data : inout bit_vector(7 downto 0); rw : in bit);
end entity cpc_multi_param_ent;
architecture bh of cpc_multi_param_ent is
  procedure drive_bus(
    signal a : in bit_vector(7 downto 0);
    signal d : inout bit_vector(7 downto 0);
    signal rw_sig : in bit) is
  begin
    if rw_sig = '1' then
      d <= a;
    end if;
  end procedure drive_bus;
begin
  drive_bus(addr, data, rw);
end architecture bh;
