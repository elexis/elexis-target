/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

//
// This source code implements specifications defined by the Java
// Community Process. In order to remain compliant with the specification
// DO NOT add / change / or delete method signatures!
//

package javax.transaction;

/**
 * @version $Rev: 467742 $ $Date: 2006-10-25 21:30:38 +0200 (Wed, 25 Oct 2006) $
 */
public class SystemException extends Exception {
    public int errorCode;

    public SystemException() {
        super();
    }

    public SystemException(String message) {
        super(message);
    }

    public SystemException(int errorCode) {
        super();
        this.errorCode = errorCode;
    }
}
