-- =============================================================
-- Case ID: TC_ACCESS_TYPE_DEFINITION_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_ACCESS_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.4.1
-- Production: access_type_definition ::= access subtype_indication
-- Case Type: Positive
-- Test Focus: SEMANTIC -- access type to record with null check before dereference
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity atd_sem_null_check is port(dout:out integer); end entity;
architecture rtl of atd_sem_null_check is
  type t_data is record val:integer; flag:bit; end record;
  type t_data_ptr is access t_data;
begin process
  variable sv:t_data_ptr;
begin
  sv:=new t_data'(val=>99,flag=>'1');
  if sv/=null and sv.flag='1' then dout<=sv.val; else dout<=0; end if; wait;
end process; end architecture;