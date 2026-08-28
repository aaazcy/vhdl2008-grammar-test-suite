-- =============================================================
-- Case ID: TC_LOGICAL_NAME_LIST_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_NAME_LIST
-- Standard Reference: IEEE 1076-2008 Section 5.5.1
-- Production: logical_name_list ::= logical_name { , logical_name }
-- Case Type: Positive
-- Test Focus: Positive: logical_name_list used to iterate over file names
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
-- Positive: logical_name_list used to iterate over file names
entity lnl_syn_iterate is port(dout:out integer); end entity;
architecture rtl of lnl_syn_iterate is
  type t_fnames is array(0 to 3) of string(1 to 6);
  constant C_FILES : t_fnames := ("f0.dat","f1.dat","f2.dat","f3.dat");
  signal s_idx:integer range 0 to 3:=0; signal s_val:integer:=0;
begin process begin for i in 0 to 3 loop s_val<=s_val+1; end loop; dout<=s_val; wait; end process; end architecture;