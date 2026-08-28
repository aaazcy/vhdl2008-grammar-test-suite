-- =============================================================
-- Case ID: TC_INTERFACE_FILE_DECLARATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_FILE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_file_declaration ::=
--   file identifier_list : subtype_indication
-- Case Type: Positive
-- Test Focus: File interface declarations with multi-identifier list
--   ("log_file, trace_file") in a subprogram parameter context,
--   wrapped inside an entity/architecture. Exercises the full
--   BNF including multi-identifier expansion.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity file_iface_gen_multifile is
  port (
    trigger : in  bit;
    done    : out bit
  );
end entity file_iface_gen_multifile;

architecture rtl of file_iface_gen_multifile is
  type t_int_file is file of integer;
  procedure write_dual_files(
    file log_file, trace_file : t_int_file;
    constant record_id : in natural
  ) is
  begin
    null;
  end procedure;
begin
  process(trigger)
  begin
    if trigger = '1' then
      done <= '1';
    else
      done <= '0';
    end if;
  end process;
end architecture rtl;
