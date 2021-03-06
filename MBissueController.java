package beximtex;
/**
 * <p>Title: BeximTex, MBissue Manager</p>
 * <p>Description: Support Software System</p>
 * <p>Copyright: 2006-2010</p>
 * <p>Company: ASKA</p>
 * @author Adeel Ashraf Malik
 * @version 1.0.0
 */

import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.*;

public interface MBissueController extends Remote
{

	public MBissue moveFirst()  throws RemoteException;
	public MBissue moveNext()  throws RemoteException;
	public MBissue movePrevious()  throws RemoteException;
	public MBissue moveLast()  throws RemoteException;

    public void Connect() throws RemoteException;
    public void setData() throws RemoteException;
	public boolean insertData(MBissue mbis) throws RemoteException;
	public boolean updateData(MBissue mbis) throws RemoteException;

	public void DeleteData(String strQuery) throws RemoteException;
	public void RunUpdate(String strQuery) throws RemoteException;
	public boolean isFound(String srchStr) throws RemoteException;
	public MBissue SearchData(String srchStr) throws RemoteException;

}//End of MBissueController Class