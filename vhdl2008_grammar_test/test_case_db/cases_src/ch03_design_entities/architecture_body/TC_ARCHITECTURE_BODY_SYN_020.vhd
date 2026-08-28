-- =============================================================
-- Case ID: TC_ARCHITECTURE_BODY_SYN_020
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_BODY
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_body ::= architecture identifier of entity_name is architecture_declarative_part begin architecture_statement_part end [ architecture ] [ architecture_simple_name ] ;
-- Case Type: Positive
-- Test Focus: File declarations and operations: declarative part contains a file type definition (file of integer) and a file object declaration (with open_read_mode/file_logical_name), the statement part uses the file type through a subprogram, verifying architecture_declarative_part supports file_declaration and file_type_definition
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity arch_file_ent is
  port(trigger:in bit; count_out:out integer);
end entity;
architecture rtl of arch_file_ent is
  type t_int_file is file of integer;
  file f_log : t_int_file open write_mode is "arch_log.txt";
  signal s_count:integer:=0;
  procedure p_write(v: in integer) is
  begin
    write(f_log, v);
  end procedure;
begin
  process(trigger)
  begin
    if trigger'event and trigger='1' then
      s_count<=s_count+1;
      p_write(s_count);
    end if;
  end process;
  count_out<=s_count;
end architecture rtl;
