-- =============================================================
-- Case ID: TC_NULL_STATEMENT_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_NULL_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.14
-- Production: null_statement ::= [ label : ] null ;
-- Case Type: Positive (Production-Specific)
-- Test Focus: Production-specific: null in a procedure — use null as a placeholder inside a subprogram body, verifying the use of null in a subprogram
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity null_in_proc_ent is
  port (
    cmd : in  integer range 0 to 7;
    ack : out boolean
  );
end entity null_in_proc_ent;

architecture cmd_handler of null_in_proc_ent is
  signal s_ack : boolean := false;
begin
  process(cmd) is
    procedure handle_cmd(c : integer range 0 to 7) is
    begin
      case c is
        when 0 => null;  -- NOP command
        when 1 => null;  -- reserved
        when others => s_ack <= true;
      end case;
    end procedure;
  begin
    handle_cmd(cmd);
  end process;
  ack <= s_ack;
end architecture cmd_handler;
